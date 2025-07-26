import os
from pathlib import Path
from cocotb.runner import get_runner


PROJECT_DIR = Path(__file__).resolve().parent.parent.parent
COCOTB_DIR = PROJECT_DIR / 'sim/cocotb'
INCLUDE_DIR = PROJECT_DIR / 'include'
OUTPUT_DIR = COCOTB_DIR / 'output_files'


def test_with_cocotb():

    sim = os.getenv("SIM", "icarus")
    hdl_toplevel_lang = os.getenv("HDL_TOPLEVEL_LANG", "verilog")

    print(f'Project path: {PROJECT_DIR.absolute()}')

    verilog_sources = [
        # *(proj_path / 'src').rglob('*.svh'),
        *(PROJECT_DIR / 'rtl').rglob('*.sv'),
        # *(proj_path / 'src').glob('*.v'),
        # *(proj_path / 'peripherals').glob('*.sv')
    ]
    vhdl_sources = []

    verilog_includes = [
        # *(proj_path / 'src').rglob('*.svh'),
    ]

    if hdl_toplevel_lang == "verilog":
        verilog_sources.append(COCOTB_DIR / "fpu/dut.sv")
        verilog_sources += [
            (INCLUDE_DIR / 'hardfloat.sv'),
        ]
    else:
        vhdl_sources.append(PROJECT_DIR / "top.vhdl")

    print('Discovered source files:', *map(lambda p: p.name, verilog_sources))

    runner = get_runner(sim)
    runner.build(
        verilog_sources=verilog_sources,
        vhdl_sources=vhdl_sources,
        includes=verilog_includes,
        hdl_toplevel="dut",
        always=True,
        build_dir=OUTPUT_DIR
    )

    runner.test(
        hdl_toplevel="dut",
        test_module="testbench",
        waves=True,
        gui=True,
        build_dir=OUTPUT_DIR,
        test_dir=COCOTB_DIR/'fpu'
    )


if __name__ == "__main__":
    test_with_cocotb()

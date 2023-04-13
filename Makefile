TOP = tb_completer.sv
APB = tb/apb_agent
I2C = tb/i2c_agent
TEST = tb/test
ENV = tb/env
SEQ = tb/sequences
REG = tb/register
REG_MODEL = $(REG)/vreguvm_pkg_uvm.sv
MASTER_AGT = tb/i2c_master_agent
INTERRUPT_AGT = tb/interrupt_agent

run_gui:
	vsim -i tb_completer -L \
	$$QUESTA_HOME/uvm-1.2 \
	-voptargs=+acc \
	-coverage \
	# +UVM_TESTNAME="i2c_slave_read_8_bytes_test" \
	+UVM_VERBOSITY=UVM_LOW \
	-do "do wave.do" -do "run -all" &

clean:
	rm -rf work
	rm -rf mitll90_Dec2019_all
	rm -rf covhtmlreport
	rm *.log
	rm transcript
	rm *.wlf
	
# all: build run-i2c_slave_write_test run-i2c_slave_incorrect_addr_test run-i2c_slave_read_8_bytes_test run-i2c_slave_continuous_read_test run-i2c_slave_stretch_write_test run-i2c_slave_tx_clear_underflow_test run-i2c_slave_continuous_write_test run-i2c_slave_rx_overflow_test

# build: 
# 	vlog +incdir+src+src/master+src/register+src/slave \
# 	+incdir+include \
# 	+incdir+$(APB) \
# 	+incdir+$(I2C) \
# 	+incdir+$(TEST) \
# 	+incdir+$(ENV) \
# 	+incdir+$(SEQ) \
# 	+incdir+$(REG) \
# 	+incdir+$(MASTER_AGT) \
# 	+incdir+$(INTERRUPT_AGT) \
# 	+acc \
# 	+cover \
# 	-L $$QUESTA_HOME/uvm-1.2 $(REG_MODEL) tb/$(TOP) \
# 	-logfile tb_compile.log \
# 	-printinfilenames=file_search.log

# run:
# 	vsim -c tb_i2c -L \
# 	$$QUESTA_HOME/uvm-1.2 \
# 	-voptargs=+acc \
# 	-coverage \
# 	+UVM_TESTNAME="i2c_slave_read_8_bytes_test" \
# 	+UVM_VERBOSITY=UVM_LOW \
# 	+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &
# 	#+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &

# run-i2c_slave_write_test:
# 	vsim -logfile transcript_i2c_slave_write_test -c tb_i2c -L \
# 	$$QUESTA_HOME/uvm-1.2 \
# 	-voptargs=+acc \
# 	-coverage \
# 	+UVM_TESTNAME="i2c_slave_write_test" \
# 	+UVM_VERBOSITY=UVM_LOW \
# 	+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &
# 	#+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &

# run-i2c_slave_incorrect_addr_test:
# 	vsim -logfile transcript_i2c_slave_incorrect_addr_test -c tb_i2c -L \
# 	$$QUESTA_HOME/uvm-1.2 \
# 	-voptargs=+acc \
# 	-coverage \
# 	+UVM_TESTNAME="i2c_slave_incorrect_addr_test" \
# 	+UVM_VERBOSITY=UVM_LOW \
# 	+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &
# 	#+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &

# run-i2c_slave_read_8_bytes_test:
# 	vsim -logfile transcript_i2c_slave_read_8_bytes_test -c tb_i2c -L \
# 	$$QUESTA_HOME/uvm-1.2 \
# 	-voptargs=+acc \
# 	-coverage \
# 	+UVM_TESTNAME="i2c_slave_read_8_bytes_test" \
# 	+UVM_VERBOSITY=UVM_LOW \
# 	+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &
# 	#+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &

# run-i2c_slave_continuous_read_test:
# 	vsim -logfile transcript_i2c_slave_continuous_read_test -c tb_i2c -L \
# 	$$QUESTA_HOME/uvm-1.2 \
# 	-voptargs=+acc \
# 	-coverage \
# 	+UVM_TESTNAME="i2c_slave_continuous_read_test" \
# 	+UVM_VERBOSITY=UVM_LOW \
# 	+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &
# 	#+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &

# run-i2c_slave_stretch_write_test:
# 	vsim -logfile transcript_i2c_slave_stretch_write_test -c tb_i2c -L \
# 	$$QUESTA_HOME/uvm-1.2 \
# 	-voptargs=+acc \
# 	-coverage \
# 	+UVM_TESTNAME="i2c_slave_stretch_write_test" \
# 	+UVM_VERBOSITY=UVM_LOW \
# 	+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &
# 	#+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &

# run-i2c_slave_tx_clear_underflow_test:
# 	vsim -logfile transcript_i2c_slave_tx_clear_underflow_test -c tb_i2c -L \
# 	$$QUESTA_HOME/uvm-1.2 \
# 	-voptargs=+acc \
# 	-coverage \
# 	+UVM_TESTNAME="i2c_slave_tx_clear_underflow_test" \
# 	+UVM_VERBOSITY=UVM_LOW \
# 	+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &
# 	#+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &

# run-i2c_slave_continuous_write_test:
# 	vsim -logfile transcript_i2c_slave_continuous_write_test -c tb_i2c -L \
# 	$$QUESTA_HOME/uvm-1.2 \
# 	-voptargs=+acc \
# 	-coverage \
# 	+UVM_TESTNAME="i2c_slave_continuous_write_test" \
# 	+UVM_VERBOSITY=UVM_LOW \
# 	+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &
# 	#+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &

# run-i2c_slave_rx_overflow_test:
# 	vsim -logfile transcript_i2c_slave_rx_overflow_test -c tb_i2c -L \
# 	$$QUESTA_HOME/uvm-1.2 \
# 	-voptargs=+acc \
# 	-coverage \
# 	+UVM_TESTNAME="i2c_slave_rx_overflow_test" \
# 	+UVM_VERBOSITY=UVM_LOW \
# 	+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &
# 	#+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &

# run_gui-i2c_slave_write_test:
# 	vsim -logfile transcript_i2c_slave_write_test -i tb_i2c -L \
# 	$$QUESTA_HOME/uvm-1.2 \
# 	-voptargs=+acc \
# 	-coverage \
# 	+UVM_TESTNAME="i2c_slave_read_8_bytes_test" \
# 	+UVM_VERBOSITY=UVM_LOW \
# 	+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &
# 	#+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &

# run:
# 	vsim -c tb_i2c -L \
# 	$$QUESTA_HOME/uvm-1.2 \
# 	-voptargs=+acc \
# 	-coverage \
# 	+UVM_TESTNAME="i2c_slave_read_8_bytes_test" \
# 	+UVM_VERBOSITY=UVM_LOW \
# 	+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &
# 	#+uvm_set_config_int=*,trial,7 +uvm_set_config_int=*,trial2,100 \
# 	-do "do wave.do" -do "run -all" &


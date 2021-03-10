vcs:
	vcs\
	-full64 \
	-f ../rtl/filist.f \
	-debug_all \
	+define+DUMP_FSDB \
	-P $NOVAS_HOME/share/PLI/VCS/LINUX64/verdi.tab \
	   $NOVAS_HOME/share/PLI/VCS/LINUX64/pli.a \
	| tee vcs.log
	./simv		

verdi:
	verdi \
	+v2k \
	-sverilog \
	-f ../rtl/filist.f \
	-top graycode_tb \
	-ssf ../my_fsdb/graycode.fsdb  &  
clean:
	#rm -rf `ls | grep -v "Makefile"|grep -v "filelist.f" | grep -v "\.v"`	#清除仿真过程文件
	rm -rf ../sim_dir/*

clean_all:
	rm -rf `ls | grep -v "Makefile"|grep -v "filelist.f"`		#清除仿真过程文件和设计文件.v

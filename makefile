


PIC_SRC_DIR = ./workspace/logo
PIC_DST_DIR = ./workspace/suniv/rootfs/apps
TOOLS_CONVERTYUV_DIR = ../eStudio/Softwares/Convert2YUV
TOOLS_BMP_COMPRESS_DIR = ../eStudio/Softwares/8bpp_interface/bmp_pack_compress

#生成输出目标文件
all:

	   make -C eLibs/
	   make -C eMod/
	   make -C livedesk/

pic2bgd:
	$(TOOLS_CONVERTYUV_DIR)/ConvertYUV.exe
	cp -f $(PIC_SRC_DIR)/*.bin $(TOOLS_BMP_COMPRESS_DIR)/bg_default$(BNUM).bmp
	chmod 777 $(TOOLS_BMP_COMPRESS_DIR)/bg_default$(BNUM).bmp
	$(TOOLS_BMP_COMPRESS_DIR)/8bpp_pack_compree/az100_batch.exe e $(TOOLS_BMP_COMPRESS_DIR)/bg_default$(BNUM).bmp $(TOOLS_BMP_COMPRESS_DIR)/tmp.o
#	cp -f $(PIC_DST_DIR)/bg_default1.bgd $(PIC_DST_DIR)/bg_default1.bgd_bkp
#	chmod 777 $(PIC_DST_DIR)/bg_default1.bgd_bkp
	cp -f $(TOOLS_BMP_COMPRESS_DIR)/tmp.o $(PIC_DST_DIR)/bg_default$(BNUM).bgd
	chmod 777 $(PIC_DST_DIR)/bg_default$(BNUM).bgd
	rm -f $(PIC_SRC_DIR)/*.bin
	rm -f $(TOOLS_BMP_COMPRESS_DIR)/tmp.o

# 删除生成的中间文件	
clean:
	   make -C livedesk/    clean
	   make -C eMod/        clean
	   make -C eLibs/       clean
image:
	cd workspace/suniv/beetles && ./image.bat
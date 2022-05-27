#!/bin/bash

#install detractron

python -m pip install 'git+https://github.com/facebookresearch/detectron2.git'

#Install panopticapi
pip install git+https://github.com/cocodataset/panopticapi.git.

#download dataset

wget --keep-session-cookies --save-cookies=cookies.txt --post-data 'username=Methawee1998&password=Met@1998!&submit=Login' https://www.cityscapes-dataset.com/login/

wget --load-cookies cookies.txt --content-disposition https://www.cityscapes-dataset.com/file-handling/?packageID=1

wget --load-cookies cookies.txt --content-disposition https://www.cityscapes-dataset.com/file-handling/?packageID=3

mkdir datasets/
mkdir datasets/cityscapes/

unzip -o leftImg8bit_trainvaltest.zip -d "datasets/cityscapes"

unzip -o gtFine_trainvaltest.zip -d "datasets/cityscapes"

export DETECTRON2_DATASETS=datasets/

pip install git+https://github.com/mcordts/cityscapesScripts.git

#Note: to create labelTrainIds.png, first prepare the above structure, then run cityscapesescript with: /content/cityscapesScripts/cityscapesscripts/preparation/createTrainIdLabelImgs.py
CITYSCAPES_DATASET=datasets/cityscapes/ python cityscapesScripts/cityscapesscripts/preparation/createTrainIdLabelImgs.py

CITYSCAPES_DATASET=datasets/cityscapes/ python cityscapesScripts/cityscapesscripts/preparation/createPanopticImgs.py

# download your pretrained model:
wget https://optgaw.dm.files.1drv.com/y4mWNpya38VArcDInoPaL7GfPMgcop92G6YRkabO1QTSWkCbo7djk8BFZ6LK_KHHIYE8wqeSAChU58NVFOZEvqFaoz392OgcyBrq_f8XGkusQep_oQsuQ7DPQCUrdLwyze_NlsyDGWot0L9agkQ-M_SfNr10ETlCF5R7BdKDZdupmcMXZc-IE3Ysw1bVHdOH4l-XEbEKFAi6ivPUbeqlYkRMQ -O h48.pth
# run the conversion
python convert-pretrain-model-to-d2.py h48.pth h48.pkl

wget https://github.com/LikeLy-Journey/SegmenTron/releases/download/v0.1.0/tf-xception65-270e81cf.pth -O x65.pth
python convert-pretrain-model-to-d2.py x65.pth x65.pkl
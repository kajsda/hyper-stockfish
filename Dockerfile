FROM debian:stable-slim
MAINTAINER RAVIHARAV
RUN echo RAVIHARAV
COPY . .
COPY requirements.txt .

# If you want to run any other commands use "RUN" before.
 #install wanted packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget unzip python3 python3-pip p7zip

#syzygy
#RUN git clone https://github.com/hyperbotauthor/syzygy.git

#add books in .7z format
RUN wget -U "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36" --no-check-certificate "https://onedrive.live.com/download?cid=547CCA53C39C1EA1&resid=547CCA53C39C1EA1%21599&authkey=AMLXM4n_ZwOk7VQ" -O cubail.7z
RUN 7zr e cubail.7z && rm cubail.7z

RUN wget --no-check-certificate -nv "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/main/Goi5.1.bin.7z" -O Goi5.1.7z
RUN 7zr e Goi5.1.7z && rm Goi5.1.7z

RUN python3 -m pip install --no-cache-dir -r requirements.txt > pip.log

#engine section
RUN bash realsf.sh  
#change here to change engine
#start bot
CMD python3 lichess-bot.py -u

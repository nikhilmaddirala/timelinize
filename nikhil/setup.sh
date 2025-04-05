# Install Go
GO="$(curl -s https://go.dev/dl/?mode=json | grep -o 'go.*.linux-amd64.tar.gz' | head -n 1 | tr -d '\r\n' )"
wget "https://dl.google.com/go/$GO"
sudo tar -C /usr/local -xzf "$GO"
rm "$GO"
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# libvips
sudo apt update
sudo apt install -y libvips-dev # TODO old version

# libvips from source
sudo apt update
sudo apt install -y build-essential pkg-config libglib2.0-dev libexpat1-dev libjpeg-dev libtiff-dev libwebp-dev liborc-0.4-dev libpng-dev

wget https://github.com/libvips/libvips/releases/download/v8.10.6/vips-8.10.6.tar.gz
tar xf vips-8.10.6.tar.gz
cd vips-8.10.6 && ./configure && make && sudo make install && sudo ldconfig

# libheif
sudo add-apt-repository ppa:ubuntuhandbook1/libheif
sudo apt update
sudo apt install libheif-dev libheif1 -y

sudo apt install libsqlite3-dev

sudo apt install ffmpeg

curl -LsSf https://astral.sh/uv/install.sh | sh

# go run main.go
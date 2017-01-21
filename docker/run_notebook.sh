docker run -i -t -p 18888:18888 wrist/pydata-osaka3 /bin/bash -c "export LD_LIBRARY_PATH=/usr/local/lib; jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=18888 --no-browser"

import pysndfile
import matplotlib.pyplot as plt

psf = pysndfile.PySndfile()
psf.open("../../script/wav/yumeyori_sutekina.wav", "r")
xs = psf.read_frames()

fs = 48000

fig = plt.figure(1)

ax = fig.add_subplot(2, 1, 1)
ax.plot(xs[0][:3*fs])
ax = fig.add_subplot(2, 1, 2)
ax.plot(xs[1][:3*fs])

plt.show()

psf.close()

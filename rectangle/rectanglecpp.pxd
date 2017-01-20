# declare c++ interface
cdef extern from "Rectangle.h" namespace "shapes":
    cdef cppclass Rectangle:
        # except + はc++のコンストラクタで発生した例外を
        # Pythonで上手く取り扱うための記述
        Rectangle() except +
        Rectangle(int, int, int, int) except +
        int x0, y0, x1, y1
        int getArea()
        void getSize(int* width, int* height)
        void move(int, int)

# 使い方1
# newで生成して.でメソッドを呼ぶ(ポインタ経由でも.で呼べる)
#
# rec_ptr = new Rectangle(1, 2, 3, 4)
# try:
#     recArea = rec_ptr.getArea()
#     ...
# finally:
#     del rec_ptr     # delete heap allocated object

# 使い方2
# スタック上のオブジェクトとしても宣言可能
# def func():
#     cdef Rectangle rect

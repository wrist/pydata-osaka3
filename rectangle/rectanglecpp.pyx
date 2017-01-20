# Pythonからアクセスできるように拡張型を宣言
cdef class PyRectangle:
    cdef Rectangle* c_rect
    def __cinit__(self, int x0, int y0, int x1, int y1):
        self.c_rect = new Rectangle(x0, y0, x1, y1)

    def __dealloc__(self):
        del self.c_rect

    def get_area(self):
        return self.c_rect.getArea()

    def get_size(self):
        cdef int width, height
        self.c_rect.getSize(&width, &height)
        return width, height

    def move(self, dx, dy):
        self.c_rect.move(dx, dy)

    # setter, getterはpropetyで宣言可能
    @property
    def x0(self):
        return self.c_rect.x0

    @property.setter
    def x0(self):
        def __set__(self, x0): self.c_rect.x0 = x0

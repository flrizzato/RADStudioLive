import os
import glob
from delphifmx import *

class Form1(Form):

    def __init__(self, owner):
        self.Image1 = None
        self.ToolBar1 = None
        self.Button1 = None
        self.Button2 = None
        self.ListBox1 = None
        self.StyleBook1 = None
        self.Edit1 = None
        self.LoadProps(os.path.join(os.path.dirname(os.path.abspath(__file__)), "uMainForm.pyfmx"))

    def FormShow(self, Sender):
        self.Edit1.Text = os.path.join(os.path.expanduser('~'), "Pictures", "*.jpg")

    def Button1Click(self, Sender):
        if not self.Edit1.Text:
            self.Edit1.Text = "Please, inform a valid folder!"
        else:
            images_path = self.Edit1.Text
            while self.ListBox1.items.count > 0:
                self.ListBox1.items.delete(0)
            for name in glob.glob(images_path):
                self.ListBox1.Items.Add(name)

    def Button2Click(self, Sender):
        pass

    def ListBox1DblClick(self, Sender):
        if self.ListBox1.itemindex > -1:
            self.Image1.Bitmap.LoadFromFile(self.ListBox1.items[self.ListBox1.itemindex])
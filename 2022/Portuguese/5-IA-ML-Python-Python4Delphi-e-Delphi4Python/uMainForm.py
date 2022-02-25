import os
import glob
from delphifmx import *

import torch
import torch.nn as nn
from torchvision import transforms
import torch.nn.functional as F
from PIL import Image

class Net(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv1 = nn.Conv2d(3, 6, 5)
        self.conv2 = nn.Conv2d(6, 12, 5)
        self.fc1   = nn.Linear(33708, 64)
        self.fc2   = nn.Linear(64, 32)
        self.fc3   = nn.Linear(32, 2)

    def forward(self, x):
        out = F.relu(self.conv1(x))
        out = F.max_pool2d(out, 2)
        out = F.relu(self.conv2(out))
        out = F.max_pool2d(out, 2)
        out = torch.flatten(out, 1)
        out = F.relu(self.fc1(out))
        out = F.relu(self.fc2(out))
        out = self.fc3(out)
        return out  


class Form1(Form):

    def __init__(self, owner):
        self.ToolBar1 = None
        self.Button1 = None
        self.Button2 = None
        self.Edit1 = None
        self.ListBox1 = None
        self.StyleBook1 = None
        self.Layout1 = None
        self.Image1 = None
        self.Label1 = None
        self.LoadProps(os.path.join(os.path.dirname(os.path.abspath(__file__)), "uMainForm.pyfmx"))

    def FormShow(self, Sender):
        self.Edit1.Text = os.path.join('./', "img_test", "*.jpg")
        self.Label1.Text = ''

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
        if self.ListBox1.itemindex > -1:
            classes = ('* C_A_T *', '* D_O_G *')
            transform = transforms.Compose([transforms.Resize(255), transforms.CenterCrop(224), transforms.ToTensor(), transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])

            img = Image.open(self.ListBox1.items[self.ListBox1.itemindex])
            img_tensor = transform(img).unsqueeze(0)

            net = Net()
            net.load_state_dict(torch.load('./dogs-vs-cats_net.pth'))
            output = net(img_tensor)
            confidence, predicted = torch.max(torch.nn.functional.softmax(output, dim=1), dim=1)
            self.Label1.Text = classes[predicted[0]] + " >> confidence: " + str(confidence.detach().numpy()[0] * 100) + '%'

    def ListBox1DblClick(self, Sender):
        if self.ListBox1.itemindex > -1:
            self.Image1.Bitmap.LoadFromFile(self.ListBox1.items[self.ListBox1.itemindex])
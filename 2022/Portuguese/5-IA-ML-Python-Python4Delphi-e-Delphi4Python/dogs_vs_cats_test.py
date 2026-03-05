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

classes = ('cat', 'dog')
transform = transforms.Compose([transforms.Resize(255), transforms.CenterCrop(224), transforms.ToTensor(), transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])

img = Image.open('./img_test/12.jpg')
img_tensor = transform(img).unsqueeze(0)

net = Net()
net.load_state_dict(torch.load('./dogs-vs-cats_net.pth'))
output = net(img_tensor)
_, predicted = torch.max(output, 1)

print('Predicted: ', classes[predicted[0]])

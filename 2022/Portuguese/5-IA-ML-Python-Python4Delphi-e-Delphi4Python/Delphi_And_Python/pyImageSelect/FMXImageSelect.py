from delphifmx import *
from uMainForm import Form1

def main():
    Application.Initialize()
    Application.Title = 'pyImageSelect'
    Application.MainForm = Form1(Application)
    Application.MainForm.Show()
    Application.Run()
    Application.MainForm.Destroy()

if __name__ == '__main__':
    main()

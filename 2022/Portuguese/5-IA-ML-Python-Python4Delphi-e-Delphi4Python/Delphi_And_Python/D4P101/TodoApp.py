from delphivcl import *

class TodoApp(Form):

    def __init__(self, Owner):
        self.Caption = "A TODO GUI Application"
        self.SetBounds(100, 100, 700, 500)

        self.task_lbl = Label(self)
        self.task_lbl.SetProps(Parent=self, Caption="Enter your TODO task")
        self.task_lbl.SetBounds(10, 10, 125, 25)

        self.task_text_box = Edit(self)
        self.task_text_box.SetProps(Parent=self)
        self.task_text_box.SetBounds(10, 30, 250, 20)

        self.add_task_btn = Button(self)
        self.add_task_btn.Parent = self
        self.add_task_btn.SetBounds(150, 75, 100, 30)
        self.add_task_btn.Caption = "Add Task"
        self.add_task_btn.OnClick = self.__add_task_on_click

        self.del_task_btn = Button(self)
        self.del_task_btn.SetProps(Parent = self, Caption = "Delete Task")
        self.del_task_btn.SetBounds(150, 120, 100, 30)
        self.del_task_btn.OnClick = self.__del_task_on_click

        self.list_of_tasks = ListBox(self)
        self.list_of_tasks.Parent = self
        self.list_of_tasks.SetBounds(300, 50, 300, 350)

        self.OnClose = self.__on_form_close

    def __on_form_close(self, Sender, Action):
        Action.Value = caFree

    def __add_task_on_click(self, Sender):
        self.list_of_tasks.Items.Add(self.task_text_box.Text)
        self.task_text_box.Text = ""

    def __del_task_on_click(self, Sender):
        self.list_of_tasks.Items.Delete(0)

def main():
    Application.Initialize()
    Application.Title = "TODO App"
    app = TodoApp(Application)
    app.Show()
    FreeConsole()
    Application.Run()
    app.Destroy()

main()
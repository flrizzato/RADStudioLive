object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      Name = 'waOla'
      PathInfo = '/olamundo'
      OnAction = WebModule1waOlaAction
    end
    item
      MethodType = mtPost
      Name = 'waPesquisa'
      PathInfo = '/pesquisa'
      OnAction = WebModule1waPesquisaAction
    end>
  Height = 230
  Width = 415
end

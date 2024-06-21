/**
 * 我的页面
 */
import { CommonDialog } from '../../views/CommonDialog'
import { StorageKeys } from '../../constants/StorageKeys'
import { RoutePath } from '../../route/RoutePath'
import { Router } from '../../route/Router'
import { LogUtils } from '../../utils/LogUtils'
import { StorageUtils } from '../../utils/StorageUtils'
import router from '@ohos.router'

@Component
export struct MinePage {
  @State account:string=router.getParams()?.['account']
  @State dialogTitle: Resource = $r('app.string.dialog_about_title')
  @State dialogContent: Resource = $r('app.string.project_desc')
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CommonDialog({ title: $dialogTitle, description: $dialogContent, showPositive: false })
  })

  aboutToAppear() {

  }

  aboutToDisappear() {
    this.dialogController = null;
  }

  build() {
    Scroll() {
      Column() {
        Column() {
          Image($r('app.media.default_avatar'))
            .height($r('app.float.size_70'))
            .width($r('app.float.size_70'))
            .border({ radius: $r('app.float.size_35') })
          Text(this.account.toString())
            .fontColor($r('app.color.color_white'))
            .fontSize($r('app.float.size_text_16'))
            .margin({ top: $r('app.float.size_10') })
        }
        .backgroundImage($r('app.media.back_mine'))
        .width("100%")
        .height($r('app.float.size_250'))
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)

        this.itemBuilder("关注", $r('app.media.icon_focus'), () => {
          Router.push(RoutePath.ContainerPage, { "containerType": "focus" })
        })
        this.itemBuilder("分类", $r('app.media.icon_type'), () => {
          Router.push(RoutePath.ContainerPage, { "containerType": "category" })
        })
        this.itemBuilder("热门", $r('app.media.hot'), () => {
          Router.push(RoutePath.ContainerPage, { "containerType": "topic" })
        })
        this.itemBuilder("排行", $r('app.media.icon_topic'), () => {
          Router.push(RoutePath.CoordinatePage)
          StorageUtils.get(StorageKeys.USER_INFO_KEY, "").then(result => {
            LogUtils.debug(`测试>>>>>>${result}`)
          })
        })
        this.itemBuilder("关于", $r('app.media.icon_about'), () => {
          this.dialogController.open()
        })

        Blank()

        Row(){
          Button("退出账号")
            .backgroundColor(Color.Red)
            .width('80%')
            .onClick(()=>{
              router.pushUrl({
                url:"pages/login/LoginPage"
              })
            })
        }

      }.justifyContent(FlexAlign.Start).height("100%")
    }
  }

  @Builder
  itemBuilder(title: string, icon: Resource, onItemClick?: () => void) {
    Stack({ alignContent: Alignment.Bottom }) {
      Row() {
        Image(icon).width($r('app.float.size_25')).height($r('app.float.size_25'))
        Text(title)
          .fontSize($r('app.float.size_text_15'))
          .fontColor($r('app.color.color_333'))
          .margin({ left: $r('app.float.size_10') })
      }
      .height($r('app.float.size_50'))
      .width("100%")
      .alignItems(VerticalAlign.Center)
      .padding({ left: $r('app.float.size_10') })

      Divider()
        .color($r('app.color.color_f5f5f5'))
        .width("100%")
    }
    .height($r('app.float.size_50'))
    .width("100%")
    .onClick(() => {
      onItemClick?.()
    })
  }
}
import router from '@ohos.router'
import axios from '@ohos/axios';
import Prompt from '@system.prompt';

@Extend(TextInput) function inputStyle() {
  .placeholderColor($r('app.color.placeholder_color'))
  .height($r('app.float.login_input_height'))
  .fontSize($r('app.float.normal_text_size'))
  .backgroundColor(Color.White)
  .margin({ top: $r('app.float.input_margin_top') })
  .padding({ left: 12 })
}

@Entry
@Component
struct RegisterPage {
  @State account:string=''
  @State  password:string=''
  @State name:string=''

  async aboutToAppear() {

    const data = { account: this.account, password:this.password,name:this.name}; // 替换为实际的 JSON 数据

    axios({
      method: 'post',
      url: 'http://192.168.80.1:8090/api/register',
      data: JSON.stringify(data), // 将数据转换为 JSON 字符串
      headers: { 'Content-Type': 'application/json' } // 设置请求头为 JSON 格式
    }).then(response => {
      // 处理响应数据
      const responseData = response.data; // 获取响应数据
      // console.log(responseData); // 打印响应数据
      console.log(JSON.stringify(responseData));
      let parsedData = JSON.parse(JSON.stringify(responseData));
      let yanzheng=parsedData.yanzheng

      if(yanzheng == '1'){

            Prompt.showToast({
              message: "注册成功",
              bottom: "100",
              duration: 3000
            })

        return
      }
    }).catch(error => {
      console.log(error)
      if(this.account=='' || this.password==''){
        Prompt.showToast({
          message:"账号或密码不能为空！",
          bottom:"100",
          duration:3000
        })
      }
      else{
        Prompt.showToast({
          message: "请求失败！",
          bottom: "100",
          duration: 3000
        })
      }
    });

  }

  build() {
    Column() {
      Row() {
        Button({type: ButtonType.Circle, stateEffect: true}) {
          Image($r ('app.media.ic_action_back'))
            .fillColor(Color.Black)
        }
        .height($r('app.float.other_login_image_size'))
        .width($r('app.float.other_login_image_size'))
        .backgroundColor($r('app.color.background'))
        .onClick(() => {
          router.back()
          console.log("Click back button")
        })
      }
      .width('100%')
      .height('10%')
      Row() {
        Image($r ('app.media.ic_register'))
          .height($r('app.float.other_login_image_size'))
          .width($r('app.float.other_login_image_size'))
          .backgroundColor($r('app.color.background'))
          .margin('10vp')

      }
      .height('30%')
      Column() {
        TextInput({ placeholder: "请输入账号" })
          .maxLength(11)
          .type(InputType.Number)
          .inputStyle()
          .onChange((value:string)=>{
            this.account=value
          })

        Line()
          .width("100%")
          .height($r('app.float.line_height'))
          .margin({
            left: $r('app.float.line_margin_left'),
            right: $r('app.float.line_margin_right')
          })
          .backgroundColor($r('app.color.line_color'))

        TextInput({ placeholder: "请输入密码" })
          .maxLength(8)
          .type(InputType.Password)
          .inputStyle()
          .onChange((value:string)=>{
            this.password=value
          })
        Line()
          .width("100%")
          .height($r('app.float.line_height'))
          .margin({
            left: $r('app.float.line_margin_left'),
            right: $r('app.float.line_margin_right')
          })
          .backgroundColor($r('app.color.line_color'))

        TextInput({ placeholder:('请输入用户名') })
          .maxLength(8)
          .type(InputType.Password)
          .inputStyle()
          .onChange((value:string)=>{
            this.name=value
          })
      }
      .backgroundColor(Color.White)
      .borderRadius($r('app.float.login_input_radius'))

      Button('注册')
        .type(ButtonType.Capsule)
        .height($r('app.float.login_button_height'))
        .fontSize($r('app.float.normal_text_size'))
        .width("100%")
        .fontWeight(FontWeight.Medium)
        .margin({ top: '50vp' })
        .onClick(() => {
          // console.log("click register button");
          this.aboutToAppear();
        })
    }
    .padding({
      left: $r('app.float.login_button_left'),
      right: $r('app.float.login_button_right'),
      bottom: $r('app.float.login_page_padding_bottom')
    })
    .backgroundColor($r('app.color.background'))
    .height('100%')
  }

}
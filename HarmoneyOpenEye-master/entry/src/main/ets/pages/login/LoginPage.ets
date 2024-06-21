import promptAction from '@ohos.promptAction'
import Prompt from '@system.prompt'
import router from '@ohos.router'
import axios from '@ohos/axios'
@Entry
@Component
struct LoginPage {
  @State account:string=''
  @State  password:string=''
  @State isShowProgress:boolean=false
  private timeOutId:number=-1 //控制登录超时时间的变量

  async aboutToAppear() {

    const data = { account: this.account, password:this.password }; // 替换为实际的 JSON 数据

    axios({
      method: 'post',
      url: 'http://192.168.80.1:8090/api/login',
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
        this.isShowProgress=true
        if(this.timeOutId===-1){
          this.timeOutId=setTimeout(()=>{
            this.isShowProgress=false,
            this.timeOutId=-1

            Prompt.showToast({
              message: "成功",
              bottom: "40",
              duration: 3000
            })

            router.pushUrl({
              url: "pages/MainPage",
              params:{
                account:this.account
              }
            })
          },3000)
        }

        return
      }
    }).catch(error => {
      console.log(error)
      if(this.account=='' || this.password==''){
        Prompt.showToast({
          message:"账号或密码不能为空！",
          bottom:"40",
          duration:3000
        })
      }
      else{
        Prompt.showToast({
          message: "请求失败！",
          bottom: "40",
          duration: 3000
        })
      }

    });

  }


  aboutToDisappear(){
    //取消定时器
    clearTimeout(this.timeOutId)
    this.timeOutId=-1
  }
  build() {
    //组件间距为20
    Column({space:60}){

      Column({space:20}){
        Image($r('app.media.ic_launcher'))
          .width(100)

        Text("WelCome")
          .fontColor(Color.White)
          .fontSize(30)

        Row(){
          TextInput({placeholder:"用户名"})
            .width('80%')
            .onChange((value:string)=>{
              this.account=value
            })
        }

        Row(){
          TextInput({placeholder:"密码"})
            .type(InputType.Password)
            .width('80%')
            .onChange((value:string)=>{
              this.password=value
            })
        }

        Row(){
          Text("短信验证码登录").fontColor(Color.Blue)
          Text("忘记密码").fontColor(Color.Blue)
        }.width("75%")
        .justifyContent(FlexAlign.SpaceBetween)
      }

      Column({space:20}){
        Button("登录")
          .width('80%')
          .onClick(()=>{
            this.aboutToAppear();
          })

        Button("注册账号")
          .backgroundColor(Color.Red)
          .width('80%')
          .onClick(() => {

            promptAction.showDialog({
              title: '提示',
              message: '您确定要注册账号吗?',
              buttons: [
                {
                  text: '确定',
                  color: 'green',
                },
                {
                  text: '取消',
                  color: 'red',
                }
              ],
            })
              .then(data => {
                console.info('showDialog success, click button: ' + data.index);
                router.pushUrl({
                  url:"pages/login/RegisterPage"
                })
              })
              .catch(err => {
                console.info('showDialog error: ' + err);
              })

          })

        if(this.isShowProgress){
          LoadingProgress()
            .width("50%")
            .height(40)
            .color(Color.Blue)
        }

        Text("其他方式登录")
          .fontColor(Color.Black)
          .fontSize(20)

        Row(){
          Button({type:ButtonType.Circle,stateEffect:true}){
            Image($r('app.media.QQ'))
              .width(60)
              .height(60)
          }
          .width("60")
          .height("60")
          .backgroundColor(Color.White)
          .onClick(()=>{
            Prompt.showToast({
              message: "QQ",
              bottom: "40",
              duration: 3000
            })
          })


          Button({type:ButtonType.Circle,stateEffect:true}){
            Image($r('app.media.WeChatLogo'))
              .width(60)
              .height(60)
          }
          .width("60")
          .height("60")
          .backgroundColor(Color.White)
          .onClick(()=>{
            Prompt.showToast({
              message: "微信",
              bottom: "40",
              duration: 3000
            })
          })

          Button({type:ButtonType.Circle,stateEffect:true}){
            Image($r('app.media.steam'))
              .width(60)
              .height(60)
          }
          .width("60")
          .height("60")
          .backgroundColor(Color.White)
          .onClick(()=>{
            Prompt.showToast({
              message: "steam",
              bottom: "40",
              duration: 3000
            })
          })

        }.width("80%")
        .justifyContent(FlexAlign.SpaceAround)

      }

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundImage($r('app.media.background'),ImageRepeat.NoRepeat)
    .backgroundImageSize({
      width:"100%",
      height:"100%"
    })
  }

}
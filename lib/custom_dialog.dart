
part of 'flutter_package.dart';


//定义枚举类型
enum DialogType { upgrade, alert }

class CustomDialog extends Dialog {
  final String? title; //标题
  final String content; //内容
  final DialogType? dialogType;
  final void Function()? cancelCallBack;
  final void Function()? confirmCallBack;

  const CustomDialog({
    super.key, 
    this.title,
    required this.content,
    this.dialogType,
    this.cancelCallBack,
    this.confirmCallBack,
  });

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case DialogType.upgrade:
        return Material(
          type: MaterialType.transparency,
          child: Center(
            child: upgradeDialog(context),
          ),
        );
      case DialogType.alert:
        return Material(
          type: MaterialType.transparency,
          child: Center(
            child: customAlertDialog(context),
          ),
        );

      default:
        return Material(
          type: MaterialType.transparency,
          child: upgradeDialog(context),
        );
    }
  }

  Widget customAlertDialog(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.only(left: 40, right: 40),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Align(
                  child: Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: const Icon(Icons.close),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const Divider(),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    content,
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget upgradeDialog(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: const ShapeDecoration(
            color: Color(0xfff2f2f2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage('images/head_icon.png'),
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: double.infinity,
                child: const Text(
                  '本次更新',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF2D2D2D),
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: double.infinity,
                child: const Text(
                  '解决了一些已知问题',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF333333),
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
             const Divider(),
              Container(
                height: 40,
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        confirmCallBack!();
                      },
                      child: const Text(
                        '升级',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const VerticalDivider(
                      color: Colors.grey,
                      width: 1,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          cancelCallBack!();
                        },
                        child:
                            const Text('暂不升级', style: TextStyle(fontSize: 18))),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

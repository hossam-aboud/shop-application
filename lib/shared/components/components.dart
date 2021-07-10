import 'package:flutter/material.dart';
import 'package:news_app/modules/news_app/web_view/web_view_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';

Widget buildDividerShared() {
  return Container(
    height: 1.0,
    width: double.infinity,
    color: Colors.grey,
  );
}

Widget buildItemData({
  required Map dataCubit,
  required BuildContext context,
}) {
  return InkWell(
    onTap: () {
      navigateTo(context: context, screen: WebViewScreen(dataCubit['url']));
    },
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: dataCubit['urlToImage'] != null
              ? Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        20.0,
                      ),
                    ),
                    image: DecorationImage(
                      image: NetworkImage('${dataCubit['urlToImage']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  height: 120.0,
                  width: 120.0,
                  alignment: Alignment(0.0, 0.0),
                  child: CircularProgressIndicator(),
                ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    '${dataCubit['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Text(
                  '${dataCubit['publishedAt']}',
                  style: TextStyle(
                    color: ThemeCubit.get(context).isDark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget defaultFormField({
  required BuildContext context,
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  required String? Function(String?) validate,
  void Function(String)? onChanged,
  void Function()? onTapFunction,
  double radius = 12,
  bool isSecureText = false,
}) {
  return TextFormField(
    style: TextStyle(
      color: ThemeCubit.get(context).isDark ? Colors.white : Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
    onTap: onTapFunction,
    onChanged: (String value) {
      onChanged!(value);
    },
    validator: (value) => validate(value),
    controller: controller,
    obscureText: isSecureText,
    keyboardType: type,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius,
          ),
        ),
        borderSide: BorderSide(),
      ),
      labelText: label,
      prefixIcon: Icon(prefix),
    ),
  );
}

void navigateTo({required BuildContext context, required Widget screen}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return screen;
  }));
}

void navigateReplacement(
    {required BuildContext context, required Widget screen}) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) {
    return screen;
  }), (route) => false);
  // this route method : return boolean :
  // his job is : اذا انا بدي اخلي الصفحة السابقة او لا
  // true : بخليها
  // false : بحزف كلشي سابق الصفحة الجديدة
}

Widget articleBuilder({
  required List list,
  required BuildContext context,
}) {
  return ListView.separated(
    itemBuilder: (BuildContext context, int index) {
      return buildItemData(dataCubit: list[index], context: context);
    },
    separatorBuilder: (BuildContext context, int index) {
      return buildDividerShared();
    },
    itemCount: list.length,
  );
}

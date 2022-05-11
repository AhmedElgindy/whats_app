import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/modules/status_details/status_details.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,top:25),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children:  [
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>StatusDetails()
                  ),
                );
              },
              child: Row(
                children:  [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                        'https://t3.ftcdn.net/jpg/03/01/94/34/240_F_301943459_hZqG7C4F3nnACx811k2CwS4YfomRT1n1.jpg',
                  ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  const [
                      Text(
                        'Mohammed Ashraf',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '4 minute',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 20),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.green.withOpacity(0.1),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
                itemBuilder:(context, index) => status(context) ,
                separatorBuilder:(context,index)=>  SizedBox(height: 20,),
                itemCount: 10,
            ),
          ],
        ),
      ),
    );

  }
  Widget status(context){
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context)=>StatusDetails()
          ),
        );
      },
      child: Row(
        children:  [
          const CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
              'https://t3.ftcdn.net/jpg/03/01/94/34/240_F_301943459_hZqG7C4F3nnACx811k2CwS4YfomRT1n1.jpg',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  const [
              Text(
                'Mohammed Ashraf',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                '4 minute',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

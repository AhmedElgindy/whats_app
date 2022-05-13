import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/layout/cubit/cubit.dart';
import 'package:whats_app/layout/cubit/states.dart';
import 'package:whats_app/modules/status_details/status_details.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WhatsCubit,WhatsStates>(
      listener: (context,state){},
      builder: (context,state){
        return BuildCondition(
          condition: WhatsCubit.get(context).status.isNotEmpty,
          builder: (context){
            return Padding(
              padding: const EdgeInsets.only(left: 16,top:25),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children:  [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder:(context, index) {
                        return allStatus(context,index);
                      } ,
                      separatorBuilder:(context,index)=> Padding(
                        padding: const EdgeInsets.only(left: 5,right: 15,top: 10,bottom: 20),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.green.withOpacity(0.1),
                        ),
                      ),
                      itemCount: WhatsCubit.get(context).status.length,
                    ),
                    /*
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
                      itemBuilder:(context, index) => status(context,index) ,
                      separatorBuilder:(context,index)=>  SizedBox(height: 20,),
                      itemCount: 1,//WhatsCubit.get(context).status.length,
                    ),

                     */
                  ],
                ),
              ),
            );
          },
          fallback: (context){
            return  Center(
              child: Text(
                'No Status',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        );
      },
    );

  }
  Widget status(context,index){
    return WhatsCubit.get(context).status[index].uId==WhatsCubit.get(context).userModel!.uId? InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context)=>StatusDetails(
                name: WhatsCubit.get(context).status[index].name!,
                image:WhatsCubit.get(context).status[index].image! ,
                imageStatus: WhatsCubit.get(context).status[index].statusImage!,
                text: WhatsCubit.get(context).status[index].text!,
                dateTime: WhatsCubit.get(context).status[index].dateTime!,
                time: WhatsCubit.get(context).status[index].time!,
              )
          ),
        );
      },
      child:WhatsCubit.get(context).status[index].uId!=WhatsCubit.get(context).userModel!.uId? Row(
        children:  [
           CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
              '${WhatsCubit.get(context).status[index].image}',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              Text(
                '${WhatsCubit.get(context).status[index].name}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                '${WhatsCubit.get(context).status[index].dateTime}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ):null,
    ):SizedBox();
  }
  Widget myStatus(context,index){
    return WhatsCubit.get(context).status[index].uId==WhatsCubit.get(context).userModel!.uId? InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context)=>StatusDetails(
                name: WhatsCubit.get(context).status[index].name!,
                image:WhatsCubit.get(context).status[index].image! ,
                imageStatus: WhatsCubit.get(context).status[index].statusImage!,
                text: WhatsCubit.get(context).status[index].text!,
                dateTime: WhatsCubit.get(context).status[index].dateTime!,
                time: WhatsCubit.get(context).status[index].time!,
              )
          ),
        );
      },
      child:WhatsCubit.get(context).status[index].uId==WhatsCubit.get(context).userModel!.uId? Row(
        children:  [
          CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                '${WhatsCubit.get(context).status[index].image}',
              ),
            ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              Text(
                WhatsCubit.get(context).status[index].name!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                WhatsCubit.get(context).status[index].dateTime!,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ):null,
    ):SizedBox();
  }

  Widget allStatus(context,index){
    return  InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context)=>StatusDetails(
                name: WhatsCubit.get(context).status[index].name!,
                image:WhatsCubit.get(context).status[index].image! ,
                imageStatus: WhatsCubit.get(context).status[index].statusImage!,
                text: WhatsCubit.get(context).status[index].text!,
                dateTime: WhatsCubit.get(context).status[index].dateTime!,
                time: WhatsCubit.get(context).status[index].time!,
              )
          ),
        );
      },
      child: Row(
        children:  [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
              '${WhatsCubit.get(context).status[index].image}',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              Text(
                WhatsCubit.get(context).status[index].name!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                WhatsCubit.get(context).status[index].dateTime!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
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

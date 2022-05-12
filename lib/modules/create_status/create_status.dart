import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/layout/cubit/cubit.dart';
import 'package:whats_app/layout/cubit/states.dart';

import '../../shared/style/colors.dart';

class CreateStatus extends StatelessWidget {
  const CreateStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return BlocConsumer<WhatsCubit,WhatsStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: defaultColor.withOpacity(0.5),
                ),
                onPressed:(){
                  Navigator.pop(context);
                }
            ),
            title: Text(
              'Create Status',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 22
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (){},
                  child: Text(
                    'Add',
                    style: TextStyle(
                        color: defaultColor.withOpacity(0.9),
                        fontSize: 16
                    ),
                  )
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child:WhatsCubit.get(context).statusImage != null?
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/whatsapp-5d984.appspot.com/o/users%2Fimage_picker5601193744695634156.jpg?alt=media&token=626db624-5231-444d-8384-7ce6b0447efa',
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Text(
                          'Mohammed Ashraf',
                          style:  TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      controller: textController,
                      decoration: const InputDecoration(
                        hintText: 'Type a Status...',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        filled: false,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                if(WhatsCubit.get(context).statusImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height:400.0,
                      //  height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0,),
                          image: DecorationImage(
                            image: FileImage(WhatsCubit.get(context).statusImage!),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const CircleAvatar(
                          radius: 20.0,
                          child: Icon(
                            Icons.close,
                            size: 16.0,
                          ),
                        ),
                        onPressed: ()
                        {
                          WhatsCubit.get(context).removePostImage();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  if(WhatsCubit.get(context).statusImage == null)
                    Spacer(),
                  if(WhatsCubit.get(context).statusImage == null)
                    Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: ()
                          {
                             WhatsCubit.get(context).getStatusImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.image,
                                color: defaultColor,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'add photo',
                                style: TextStyle(
                                    color: defaultColor
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            )
                :Column(
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/whatsapp-5d984.appspot.com/o/users%2Fimage_picker5601193744695634156.jpg?alt=media&token=626db624-5231-444d-8384-7ce6b0447efa',
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Text(
                        'Mohammed Ashraf',
                        style:  TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: 'Type a Status...',
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      filled: false,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),

                if(WhatsCubit.get(context).statusImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height:400.0,
                        //  height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0,),
                          image: DecorationImage(
                            image: FileImage(WhatsCubit.get(context).statusImage!),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const CircleAvatar(
                          radius: 20.0,
                          child: Icon(
                            Icons.close,
                            size: 16.0,
                          ),
                        ),
                        onPressed: ()
                        {
                          WhatsCubit.get(context).removePostImage();
                        },
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 20.0,
                ),
                if(WhatsCubit.get(context).statusImage == null)
                  Spacer(),
                if(WhatsCubit.get(context).statusImage == null)
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: ()
                          {
                            WhatsCubit.get(context).getStatusImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.image,
                                color: defaultColor,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'add photo',
                                style: TextStyle(
                                    color: defaultColor
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

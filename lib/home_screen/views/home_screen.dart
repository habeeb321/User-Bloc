import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/home_screen/user/user_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User API")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return state.loading == true
                      ? const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 4,
                            backgroundColor: Colors.orange,
                          ),
                        )
                      : state.userModel?.data == null
                          ? const Center(
                              child: Text(
                                "No Data",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var data = state.userModel?.data?[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        NetworkImage(data?.avatar ?? ''),
                                  ),
                                  title: Text((data?.firstName ?? '') +
                                      (data?.lastName ?? '')),
                                  subtitle: Text(data?.email ?? ''),
                                  trailing: Text("${data?.id}"),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                              itemCount: state.userModel?.data?.length ?? 0,
                            );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<UserBloc>().add(const FetchApiEvent());
        },
        label: const Text("Fetch API"),
      ),
    );
  }
}

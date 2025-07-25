import 'package:final_project/Core/widgets/custom_button.dart';
import 'package:final_project/features/Authentication/controller/async_auth_provider.dart';
import 'package:final_project/features/Authentication/repository/auth_repository.dart';
import 'package:final_project/features/Authentication/view/Widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileTab extends ConsumerStatefulWidget {
  const ProfileTab({super.key});

  @override
  ConsumerState<ProfileTab> createState() => _ProfileTabState();
}

final List<String> avatarPaths = [
  'assets/Beer_profile.jpg',
  'assets/Cat_profile.webp',
  'assets/Girl_profile.jpg',
  'assets/Girl2_profile.webp',
];

String? selectedAvatarPath;

class _ProfileTabState extends ConsumerState<ProfileTab> {
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    _nameController.text = user?.displayName ?? '';
    // ممكن هنا لو كنت حافظ الصورة تسترجعها من Realm أو Firestore
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Profile"),backgroundColor: Colors.white,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: selectedAvatarPath != null
                          ? AssetImage(selectedAvatarPath!)
                          : null,
                      child: selectedAvatarPath == null
                          ? const Icon(Icons.person, size: 40)
                          : null,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user?.displayName ?? "No name",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user?.email ?? "No email",
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text("Choose your avatar:", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: avatarPaths.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final path = avatarPaths[index];
                    final isSelected = selectedAvatarPath == path;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAvatarPath = path;
                        });
                        // تقدر تحفظ الصورة هنا في Realm أو Firestore لو حبيت
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(path),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomTextfromfield(
                controller: _nameController,
                lable: 'Enter New Name ',
              ),
              const SizedBox(height: 10),
              Center(
                child: CustomButton(
                  onPressed: () async {
                    final newName = _nameController.text.trim();
                    if (newName.isNotEmpty) {
                      await ref
                          .read(asyncAuthRepoProvider)
                          .updateUserName(username: newName);
                      await FirebaseAuth.instance.currentUser?.reload();
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Name updated successfully')),
                      );
                    }
                  },
                  title: "Save Name",
                ),
              ),
               Spacer(),
              Expanded(
                child: Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onPressed: () async {
                      final result = await ref.read(asyncAuthProvider.notifier).logout();
                      if (context.mounted && result) {
                        Navigator.pushReplacementNamed(context, '/sign_in_Screen');
                      }
                    },
                    icon: const Icon(Icons.logout, color: Colors.black),
                    label: const Text(
                      'Sign Out',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

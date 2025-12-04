import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/screens/cadastrar_metas.dart';
import 'package:pdm_projeto_pesquisa/screens/create_account.dart';
import 'package:pdm_projeto_pesquisa/screens/login_screen.dart';
import 'package:pdm_projeto_pesquisa/screens/metas_page.dart';
import 'package:pdm_projeto_pesquisa/screens/metas_semanais.dart';
part 'routers.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: Routes.INITIAL, page: () => LoginScreen()),
    GetPage(name: Routes.HOME, page: () => const MetasPage()),
    GetPage(name: Routes.CREATE_ACCOUNT, page: () => CreateAccount()),
    GetPage(name: Routes.CREATE_META, page: () => CadastrarMetas()),
    GetPage(name: Routes.WEEK_META, page: () => MetasSemanais())
  ];
}
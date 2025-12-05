import 'package:get/get.dart';
import 'package:pdm_projeto_pesquisa/screens/cadastrar_metas.dart';
import 'package:pdm_projeto_pesquisa/screens/create_account.dart';
import 'package:pdm_projeto_pesquisa/screens/login_screen.dart';
import 'package:pdm_projeto_pesquisa/screens/metas_page.dart';
import 'package:pdm_projeto_pesquisa/screens/metas_semanais.dart';
import 'package:pdm_projeto_pesquisa/screens/check_in.dart';
import 'package:pdm_projeto_pesquisa/screens/create_check_in.dart';
import 'package:pdm_projeto_pesquisa/screens/check_out.dart';
import 'package:pdm_projeto_pesquisa/screens/realizar_check_out.dart';
import 'package:pdm_projeto_pesquisa/screens/formulario_de_coleta.dart';
import 'package:pdm_projeto_pesquisa/screens/novo_formulario.dart';
import 'package:pdm_projeto_pesquisa/screens/historico_formularios.dart';
part 'routers.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: Routes.INITIAL, page: () => LoginScreen()),
    GetPage(name: Routes.HOME, page: () => const MetasPage()),
    GetPage(name: Routes.CREATE_ACCOUNT, page: () => CreateAccount()),
    GetPage(name: Routes.CREATE_META, page: () => CadastrarMetas()),
    GetPage(name: Routes.WEEK_META, page: () => MetasSemanais()),
    GetPage(name: Routes.FORMULARIO_COLETA, page: () => const FormularioDeColeta()),
    GetPage(name: Routes.NOVO_FORMULARIO, page: () => const NovoFormularioPage()),
    GetPage(name: Routes.HISTORICO_FORMULARIOS, page: () => const HistoricoFormulariosPage()),
    GetPage(name: Routes.CHECK_IN, page: () => const CheckIn()),
    GetPage(name: Routes.CREATE_CHECK_IN, page: () => const CreateCheckIn()),
    GetPage(name: Routes.CHECK_OUT, page: () => const CheckOut()),
    GetPage(name: Routes.REALIZAR_CHECK_OUT, page: () => const RealizarCheckOut()),
  ];
}
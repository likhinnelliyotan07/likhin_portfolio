import '../models/portfolio_model.dart';
import 'portfolio_local_data_source.dart';

class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  @override
  Future<PortfolioModel> getPortfolio() async => PortfolioModel.current;
}

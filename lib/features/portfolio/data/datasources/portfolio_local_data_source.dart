import '../models/portfolio_model.dart';

abstract class PortfolioLocalDataSource {
  Future<PortfolioModel> getPortfolio();
}

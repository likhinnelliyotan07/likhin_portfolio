import '../entities/portfolio_profile.dart';

abstract class PortfolioRepository {
  Future<PortfolioProfile> getPortfolio();
}

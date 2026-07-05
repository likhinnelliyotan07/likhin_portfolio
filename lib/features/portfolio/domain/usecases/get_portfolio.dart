import '../entities/portfolio_profile.dart';
import '../repositories/portfolio_repository.dart';

class GetPortfolio {
  const GetPortfolio(this.repository);

  final PortfolioRepository repository;

  Future<PortfolioProfile> call() => repository.getPortfolio();
}

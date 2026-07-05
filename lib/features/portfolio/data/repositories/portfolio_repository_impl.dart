import '../../domain/entities/portfolio_profile.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_local_data_source.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  const PortfolioRepositoryImpl(this.localDataSource);

  final PortfolioLocalDataSource localDataSource;

  @override
  Future<PortfolioProfile> getPortfolio() => localDataSource.getPortfolio();
}

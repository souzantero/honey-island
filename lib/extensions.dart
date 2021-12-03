
extension CurrencyParsing on double {
  String toCurrency() => 'R\$ ${toDouble().toStringAsFixed(2)}';
}

extension PercentageParsing on double {
  String toPercentage() => '${toDouble().toStringAsFixed(2)} %';
}
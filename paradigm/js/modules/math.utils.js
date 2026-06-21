export function calculateTDSNewRegime(monthlyGross) {
  const annualGross = monthlyGross * 12;
  const standardDeduction = 75000;
  const taxableIncome = Math.max(0, annualGross - standardDeduction);

  if (taxableIncome <= 1200000) {
    return 0;
  }

  let tax = 0;
  if (taxableIncome > 2400000) {
    tax += (taxableIncome - 2400000) * 0.3;
    tax += 400000 * 0.25;
    tax += 400000 * 0.2;
    tax += 400000 * 0.15;
    tax += 400000 * 0.1;
    tax += 400000 * 0.05;
  } else if (taxableIncome > 2000000) {
    tax += (taxableIncome - 2000000) * 0.25;
    tax += 400000 * 0.2;
    tax += 400000 * 0.15;
    tax += 400000 * 0.1;
    tax += 400000 * 0.05;
  } else if (taxableIncome > 1600000) {
    tax += (taxableIncome - 1600000) * 0.2;
    tax += 400000 * 0.15;
    tax += 400000 * 0.1;
    tax += 400000 * 0.05;
  } else if (taxableIncome > 1200000) {
    tax += (taxableIncome - 1200000) * 0.15;
    tax += 400000 * 0.1;
    tax += 400000 * 0.05;
  }

  tax = tax * 1.04; // 4% Cess
  return Math.round((tax / 12) * 100) / 100;
}

export function calculateCTCParameters(grossVal, pfRateConfig, pfStatus, professionalTax, tds, customDeductions) {
  const pfRate = (typeof pfRateConfig !== "undefined" ? pfRateConfig : 12.0) / 100;
  const monthlyPfDeduction = pfStatus === "Applicable" ? grossVal * pfRate : 0;
  const ptDeduction = professionalTax || 0;
  const tdsDeduction = tds || 0;
  const otherDeductions = customDeductions || 0;

  const totalDeductions = monthlyPfDeduction + ptDeduction + tdsDeduction + otherDeductions;
  const netMonthlySalary = grossVal - totalDeductions;
  const employerPfContribution = monthlyPfDeduction;
  const monthlyCTC = grossVal + employerPfContribution;
  const annualCTC = monthlyCTC * 12;

  return {
    monthlyPfDeduction,
    ptDeduction,
    tdsDeduction,
    totalDeductions,
    netMonthlySalary,
    employerPfContribution,
    monthlyCTC,
    annualCTC
  };
}

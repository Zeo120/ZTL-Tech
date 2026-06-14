const { PDFDocument, rgb, StandardFonts } = require('pdf-lib');
const fs = require('fs');

async function createPayslip() {
  const pdfDoc = await PDFDocument.create();
  const page = pdfDoc.addPage([600, 800]);
  const font = await pdfDoc.embedFont(StandardFonts.Helvetica);
  const boldFont = await pdfDoc.embedFont(StandardFonts.HelveticaBold);

  const drawText = (text, x, y, size = 10, f = font) => {
    page.drawText(text, { x, y, size, font: f, color: rgb(0, 0, 0) });
  };

  // Header
  drawText('AKIN ANALYTICS SOLUTIONS PRIVATE LIMITED', 150, 750, 14, boldFont);
  drawText('202, 2ND FLOOR, RAJ BHAVAN ROAD, LAKE MELODY APARTMENT', 130, 735, 10);
  drawText('SOMAJIGUDA-500082 TELANGANA', 220, 720, 10);
  drawText('e-Mail : *****i.pn21@gmail.com', 230, 705, 10);

  // Line
  page.drawLine({ start: { x: 50, y: 690 }, end: { x: 550, y: 690 }, thickness: 1 });

  drawText('Pay Slip For the Month of May-2026', 200, 670, 12, boldFont);
  drawText('(From 01/05/2026 To 31/05/2026)', 210, 655, 10);

  // Employee Info
  drawText('Employee Name', 50, 620, 10, boldFont); drawText(': NEELAGIRI V SUBBA RAO', 150, 620, 10);
  drawText('DOJ', 350, 620, 10, boldFont); drawText(': 31/03/2026', 420, 620, 10);

  drawText('PAN', 50, 600, 10, boldFont); drawText(':', 150, 600, 10);
  drawText('DOB', 350, 600, 10, boldFont); drawText(':', 420, 600, 10);

  drawText('Employee Code', 50, 580, 10, boldFont); drawText(': AA/B-033', 150, 580, 10);
  drawText('Father\'s Name', 350, 580, 10, boldFont); drawText(':', 420, 580, 10);

  drawText('Department', 50, 560, 10, boldFont); drawText(': NON TECH TEAM', 150, 560, 10);

  // Table Headers
  page.drawLine({ start: { x: 50, y: 540 }, end: { x: 550, y: 540 }, thickness: 1 });
  drawText('Earnings', 55, 525, 10, boldFont); drawText('Amount Rs.', 250, 525, 10, boldFont);
  drawText('Deductions', 305, 525, 10, boldFont); drawText('Amount Rs.', 480, 525, 10, boldFont);
  page.drawLine({ start: { x: 50, y: 515 }, end: { x: 550, y: 515 }, thickness: 1 });

  // Rows
  drawText('BASIC SALARY', 55, 495, 10); drawText('50,000.00', 250, 495, 10);
  drawText('PROFESSIONAL TAX', 305, 495, 10); drawText('200.00', 480, 495, 10);

  drawText('HRA', 55, 475, 10); drawText('20,000.00', 250, 475, 10);
  drawText('SPECIAL ALLOWANCE', 55, 455, 10); drawText('30,000.00', 250, 455, 10);

  // Totals
  page.drawLine({ start: { x: 50, y: 440 }, end: { x: 550, y: 440 }, thickness: 1 });
  drawText('Total Earnings', 55, 425, 10, boldFont); drawText('100,000.00', 250, 425, 10, boldFont);
  drawText('Total Deductions', 305, 425, 10, boldFont); drawText('200.00', 480, 425, 10, boldFont);
  page.drawLine({ start: { x: 50, y: 415 }, end: { x: 550, y: 415 }, thickness: 1 });

  // Net Pay
  drawText('Net Pay : Rs. 99,800.00', 50, 390, 10, boldFont);
  drawText('In Words : Rs. Ninety Nine Thousand Eight Hundred Only', 50, 375, 10, boldFont);

  // CTC
  drawText('Employer\'s Contribution (CTC)', 50, 340, 11, boldFont);
  drawText('GROSS EARNING', 50, 320, 10); drawText('100,000.00', 480, 320, 10);
  drawText('EMPLOYER\'S PROVIDENT FUND', 50, 305, 10); drawText('Nil', 480, 305, 10);
  drawText('- - - > PENSION FUND', 70, 290, 10); drawText('Nil', 480, 290, 10);
  drawText('- - - > PROVIDENT FUND', 70, 275, 10); drawText('Nil', 480, 275, 10);
  drawText('EMPLOYER\'S STATE INSURANCE', 50, 260, 10); drawText('Nil', 480, 260, 10);

  page.drawLine({ start: { x: 50, y: 245 }, end: { x: 550, y: 245 }, thickness: 1 });
  drawText('Total :', 50, 230, 10, boldFont); drawText('100,000.00', 480, 230, 10, boldFont);
  page.drawLine({ start: { x: 50, y: 220 }, end: { x: 550, y: 220 }, thickness: 1 });

  drawText('Total CTC : Rs. 100,000.00', 50, 195, 10, boldFont);
  drawText('In Words : Rs. One Lakh Only', 50, 180, 10, boldFont);

  // Footer
  drawText('This is Computer Generated Sheet, does not require Signature.', 50, 100, 9);
  drawText('Authorised Signatory', 450, 100, 10, boldFont);

  const pdfBytes = await pdfDoc.save();
  fs.writeFileSync('D:\\\\Project XT\\\\Sample_Payslip_Output.pdf', pdfBytes);
  console.log('PDF Generated Successfully!');
}

createPayslip().catch(console.error);

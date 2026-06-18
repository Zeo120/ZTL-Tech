import * as core from './modules/core.js';
import * as ui from './modules/ui.js';
import * as crm from './modules/crm.js';
import * as payroll from './modules/payroll.js';
import * as ops from './modules/operations.js';
import * as hr from './modules/hr.js';
import * as sourcing from './modules/sourcing.js';
import * as crypto from './modules/crypto.js';

const modules = [core, ui, crm, payroll, ops, hr, sourcing, crypto];
modules.forEach(mod => {
    Object.keys(mod).forEach(key => {
        window[key] = mod[key];
    });
});

document.addEventListener('ParadigmDOMReady', async () => {
    if (window.initializeE2E) await window.initializeE2E();
    if (window.applyMinimalistUI) window.applyMinimalistUI();
    if (window.loadUserData) window.loadUserData();
});

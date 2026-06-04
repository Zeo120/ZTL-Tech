const fs = require('fs');
let code = fs.readFileSync('paradigm/admin.html', 'utf8');

const target = `                        if (overlay) {
                            overlay.style.opacity = '0';
                            overlay.style.pointerEvents = 'none';
                            overlay.style.transform = 'scale(1.05)';
                        }`;

const replacement = `                        if (overlay) {
                            overlay.style.opacity = '0';
                            overlay.style.pointerEvents = 'none';
                            overlay.style.transform = 'scale(1.05)';
                            setTimeout(() => { overlay.style.display = 'none'; }, 800);
                        }`;

code = code.replace(target, replacement);

const errorCatchTarget = `            } catch (err) {
                console.error(err);
            }`;

const errorCatchReplacement = `            } catch (err) {
                console.error(err);
                document.getElementById('reveal-welcome-status').textContent = 'ERROR: ' + err.message;
                document.getElementById('reveal-welcome-status').style.color = 'red';
            }`;

code = code.replace(errorCatchTarget, errorCatchReplacement);

fs.writeFileSync('paradigm/admin.html', code);
console.log('Patched admin.html animation and error handling');

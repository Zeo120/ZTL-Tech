const SENSITIVE_KEY_PARTS = [
  'password',
  'token',
  'authorization',
  'cookie',
  'jwt',
  'secret',
  'hash'
];

function isSensitiveKey(key) {
  const lower = key.toLowerCase();
  return SENSITIVE_KEY_PARTS.some((part) => lower.includes(part));
}

function sanitize(value) {
  if (!value || typeof value !== 'object') return value;

  if (value instanceof Error) {
    return {
      name: value.name,
      message: value.message,
      stack: value.stack
    };
  }

  if (Array.isArray(value)) return value.map(sanitize);

  return Object.fromEntries(
    Object.entries(value).map(([key, nestedValue]) => {
      if (isSensitiveKey(key)) return [key, '[redacted]'];
      return [key, sanitize(nestedValue)];
    })
  );
}

function write(level, event, meta = {}) {
  const entry = {
    level,
    event,
    time: new Date().toISOString(),
    ...sanitize(meta)
  };

  const line = JSON.stringify(entry);
  if (level === 'error') {
    console.error(line);
    return;
  }
  console.log(line);
}

const logger = {
  info: (event, meta) => write('info', event, meta),
  warn: (event, meta) => write('warn', event, meta),
  error: (event, meta) => write('error', event, meta)
};

module.exports = { logger };

const { fail } = require('../utils/responses');
const { findUserAuthState } = require('../services/user.service');

const ROLE_RANK = {
  user: 1,
  admin: 2,
  'super-admin': 3,
  super_admin: 3
};

function roleMatches(actualRole, expectedRole) {
  return ROLE_RANK[actualRole] === ROLE_RANK[expectedRole]
    && ROLE_RANK[actualRole] === ROLE_RANK['super-admin'];
}

function requireRole(...allowedRoles) {
  return function roleMiddleware(req, res, next) {
    const role = req.auth && req.auth.role;
    const allowed = allowedRoles.some((allowedRole) => allowedRole === role || roleMatches(role, allowedRole));

    if (!role || !allowed) {
      return fail(res, 403, 'Insufficient permissions');
    }
    return next();
  };
}

function requireAtLeastRole(minRole) {
  return function roleRankMiddleware(req, res, next) {
    const role = req.auth && req.auth.role;
    const minRank = ROLE_RANK[minRole];
    const userRank = ROLE_RANK[role];

    if (!minRank || !userRank || userRank < minRank) {
      return fail(res, 403, 'Insufficient permissions');
    }
    return next();
  };
}

function revalidateRoleAtLeast(minRole) {
  return async function roleRevalidationMiddleware(req, res, next) {
    const userId = req.auth && req.auth.userId;
    if (!userId) return fail(res, 401, 'Authentication required');

    const minRank = ROLE_RANK[minRole];
    if (!minRank) return fail(res, 403, 'Insufficient permissions');

    try {
      const user = await findUserAuthState(userId);
      const userRank = user && ROLE_RANK[user.role];

      if (!user || !user.is_active || !userRank || userRank < minRank) {
        return fail(res, 403, 'Insufficient permissions');
      }

      req.auth.role = user.role;
      return next();
    } catch (error) {
      return next(error);
    }
  };
}

module.exports = { requireRole, requireAtLeastRole, revalidateRoleAtLeast };

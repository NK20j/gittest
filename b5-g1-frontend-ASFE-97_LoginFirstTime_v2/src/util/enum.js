export const ROLE = {
  ADMIN: "ADMIN",
  STAFF: "STAFF",
};

export const STAFF_SIDEBAR = [{ content: "Home", route: "/" }];

export const ADMIN_SIDEBAR = [
  { content: "Home", route: "/" },
  { content: "Manage User", route: "/user" },
  { content: "Manage Asset", route: "/asset" },
  { content: "Manage Assignment", route: "/assignment" },
  { content: "Request for Returning", route: "/RequestForReturning" },
  { content: "Report", route: "/report" },
];

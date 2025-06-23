const { syncDB } = require("../../tasks/sync-db");

describe("Sync DB Tests", () => {
  test("syncDB must be called twice", () => {
    syncDB();
    const times = syncDB();
    expect(times).toBe(2);
  });
});

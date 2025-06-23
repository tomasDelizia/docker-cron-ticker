let times = 0;

const syncDB = () => {
    times++;
    console.log('Syncing DB', times);
    return times;
}

module.exports = {
    syncDB
};
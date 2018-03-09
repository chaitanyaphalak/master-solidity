pragma solidity ^0.4.20;

contract ToDo {
    struct Task {
        string taskName;
        string taskTime;
    }
    
    event LogTaskAdded(uint taskId, string taskName, string taskTime);
    mapping (uint => Task) private TaskMap;
    uint[] private taskIdList;
    
    function addTask(uint _id, string _taskName, string _taskTime) public returns (bool) {
        TaskMap[_id] = Task({
            taskName: _taskName,
            taskTime: _taskTime
        });
        taskIdList.push(_id);
        emit LogTaskAdded(_id, _taskName, _taskTime);
        return true;
    }
    
    function getTask(uint id) public constant returns (string, string) {
        return (TaskMap[id].taskName, TaskMap[id].taskTime);
    }
    
    function getTasksCount() public constant returns (uint) {
        return taskIdList.length;
    } 
}

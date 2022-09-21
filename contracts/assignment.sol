// SPDX-License-Identifier: GPL-3.0
pragma abicoder v2;
pragma solidity ^0.8.7;
contract Assignment {
    address public admin;
    uint public roll;
    constructor(){
        admin = msg.sender;
    }
 modifier onlyAdmin(){
        require(msg.sender == admin,"you are not the admin");
        _;}
        struct StudentData{
            string name;
            uint age;
            uint roll;
            uint marks;
            uint class;
            string gender;
        }
        StudentData[] public students;
        mapping(uint => StudentData) public StudentMap;
        function setStudent(
            string memory _name,
            uint _age,
            uint _roll,
            uint _marks,
            uint _class,
            string memory _gender
        ) public onlyAdmin{
            StudentMap[_roll] = StudentData(_name, _age, _roll, _marks, _class, _gender);
             students.push(StudentData(_name, _age,_roll, _marks, _class, _gender));
        }
     
         function showData(uint _roll) public view returns(StudentData memory){
        return students[_roll];
        }
       function allData() public view onlyAdmin returns(StudentData[] memory){
        return students;}

         function HighMarks() public view returns(uint){
             uint result;
             for(uint i = 0; i < students.length;i++){
                 if(students[i].marks > result){result = students[i].marks;}
             }
             return result;
         }
         function LowMarks() public view returns(uint){
             uint result;
             for(uint i = 0; i < students.length; i++){
                 if(i == 0){   result = students[i].marks;}
             }
             return result;
         }
        }


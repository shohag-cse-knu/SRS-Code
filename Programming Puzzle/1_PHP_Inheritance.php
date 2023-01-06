<?php 
class Employee
{
    private $id;
    private $name;
    private $phone;
    public function __construct($id, $name, $phone)
    {
        $this->id = $id;
        $this->name = $name;
        $this->phone = $phone;
    }
    public function getEmployeeId()
    {
        return $this->id;
    }
  	public function getEmployeeName()
    {
        return $this->name;
    }
    public function getEmployeePhone()
    {
        return $this->phone;
    }
}
class EmployeeList extends ArrayObject
{
    public function displayAsTable() 
    {
        $table = '<table border="1" cellspacing="0">';
        $iterator = $this->getIterator();
        while($iterator->valid())
        {
            $employee = $iterator->current(); 
            $table .= '<tr>
                           <td>'.$employee->getEmployeeId().'</td>
                           <td>'.$employee->getEmployeeName().'</td>
                           <td>'.$employee->getEmployeePhone().'</td>
                       </tr>'; 
            $iterator->next();
        }
        $table .= '</table>';
        return $table;
    }
}
 
$object = new EmployeeList();
$object[] = new Employee(20160028, 'Syfur Rahaman Shohag', '01676332242');
$object[] = new Employee(20160029, 'Sajib Ahmed', '01726000000');
$object[] = new Employee(20160030, 'Nabil Ahmed', '01726000001');
 
echo $object->displayAsTable();

?>
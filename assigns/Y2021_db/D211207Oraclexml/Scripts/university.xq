<university-1>
   {
    for $d in doc("university_1.xml")/university/department
    return
    <department>
        {$d/*}
        {
         for $c in doc("university_1.xml")/university/course[dept_name=$d/dept_name]
          return $c
        }
    </department>
   }
   {
   for $i in doc("university_1.xml")/university/instructor
   return 
   <instructor>
    {$i/*}
    {
    for $c in doc("university_1.xml")/university/teaches[IID=$i/IID]
    return $c/course_id
    }
   </instructor>
   }
</university-1>
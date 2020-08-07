with Ada.Text_IO; use Ada.Text_IO;

with Alire.Directories;

package body Alire.Utils.Text_Files is

   --------------
   -- Finalize --
   --------------

   overriding
   procedure Finalize (This : in out File) is
      File : File_Type;
   begin
      if This.Lines = This.Orig then
         Trace.Debug ("No changes to save in " & This.Name);
         return;
      end if;

      declare
         Replacer : Directories.Replacer :=
                      Directories.New_Replacement (This.Name, This.Backup);
      begin
         Open (File, Out_File, Replacer.Editable_Name);
         for Line of This.Lines loop
            Put_Line (File, Line);
         end loop;
         Close (File);
         Replacer.Replace;
      end;
   end Finalize;

   -----------
   -- Lines --
   -----------

   function Lines (This : aliased in out File) return access String_Vector
   is (This.Lines'Access);

   ----------
   -- Load --
   ----------

   function Load (From   : Any_Path;
                  Backup : Boolean := True)
                  return File
   is
      F : File_Type;
   begin
      return This : File := (Ada.Finalization.Limited_Controlled with
                             Length => From'Length,
                             Name   => From,
                             Backup => Backup,
                             others => <>)
      do
         Open (F, In_File, From);
         while not End_Of_File (F) loop
            This.Orig.Append (Get_Line (F));
         end loop;
         Close (F);

         This.Lines := This.Orig;
      end return;
   end Load;

end Alire.Utils.Text_Files;

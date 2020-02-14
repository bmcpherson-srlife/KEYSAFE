-- Copyright (c) 2020 Christian Brunner
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

CREATE OR REPLACE TABLE KEYSAFE.LINES
( 
  LINK CHAR(32) CCSID 1141 DEFAULT NULL , 
  DESCRIPTION_SHORT FOR COLUMN DES_SHORT VARCHAR(128) FOR BIT DATA DEFAULT NULL , 
  DESCRIPTION_LONG FOR COLUMN DES_LONG VARCHAR(256) FOR BIT DATA DEFAULT NULL , 
  USERNAME FOR COLUMN USRNAM VARCHAR(256) FOR BIT DATA DEFAULT NULL , 
  USER_PASSWORD FOR COLUMN PWD VARCHAR(256) FOR BIT DATA DEFAULT NULL , 
  URL VARCHAR(256) FOR BIT DATA DEFAULT NULL , 
  REMARKS VARCHAR(1024) FOR BIT DATA DEFAULT NULL , 
  STAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP , 
  LAST_USER FOR COLUMN LASTUSR VARCHAR(128) ALLOCATE(10) CCSID 1141 DEFAULT USER
) RCDFMT LIN00; 
  
ALTER TABLE KEYSAFE.LINES ADD CONSTRAINT KEYSAFE.LINES_PRIMARY_KEY UNIQUE(LINK); 
  
ALTER TABLE KEYSAFE.LINES 
  ADD CONSTRAINT KEYSAFE.MAIN_LINE_LINK FOREIGN KEY(LINK) 
  REFERENCES KEYSAFE.MAIN (LINK) 
  ON DELETE CASCADE 
  ON UPDATE NO ACTION; 
  
LABEL ON TABLE KEYSAFE.LINES IS 'Secure key store - positions'; 
  
LABEL ON COLUMN KEYSAFE.LINES 
(
  LINK IS 'Link', 
  DESCRIPTION_SHORT IS 'Description         Short', 
  DESCRIPTION_LONG IS 'Description         Long', 
  USERNAME IS 'Username', 
  USER_PASSWORD IS 'Password', 
  REMARKS IS 'Remarks', 
  STAMP IS 'Change', 
  LAST_USER IS 'Last                User'
); 
  
LABEL ON COLUMN KEYSAFE.LINES 
(
  LINK TEXT IS 'Link', 
  DESCRIPTION_SHORT TEXT IS 'Short description', 
  DESCRIPTION_LONG TEXT IS 'Long description', 
  USERNAME TEXT IS 'Username', 
  USER_PASSWORD TEXT IS 'Password', 
  URL TEXT IS 'URL', 
  REMARKS TEXT IS 'Remarks', 
  STAMP TEXT IS 'Changestamp', 
  LAST_USER TEXT IS 'Changed by user'
); 
	
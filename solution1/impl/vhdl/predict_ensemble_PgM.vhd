-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_PgM_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_PgM_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0", 4 => "1", 5 to 6=> "0", 7 => "1", 8 => "0", 9 to 13=> "1", 14 to 15=> "0", 
    16 => "1", 17 => "0", 18 => "1", 19 to 20=> "0", 21 => "1", 22 => "0", 23 => "1", 
    24 => "0", 25 to 27=> "1", 28 to 30=> "0", 31 to 33=> "1", 34 to 36=> "0", 37 to 38=> "1", 39 to 41=> "0", 
    42 => "1", 43 to 45=> "0", 46 => "1", 47 => "0", 48 => "1", 49 to 50=> "0", 51 to 52=> "1", 
    53 => "0", 54 to 56=> "1", 57 to 58=> "0", 59 to 60=> "1", 61 => "0", 62 to 64=> "1", 65 to 67=> "0", 
    68 to 69=> "1", 70 to 75=> "0", 76 to 77=> "1", 78 to 79=> "0", 80 to 81=> "1", 82 => "0", 83 => "1", 
    84 => "0", 85 to 88=> "1", 89 to 92=> "0", 93 to 94=> "1", 95 to 96=> "0", 97 to 98=> "1", 99 => "0", 
    100 => "1", 101 => "0", 102 to 106=> "1", 107 to 108=> "0", 109 => "1", 110 to 112=> "0", 113 to 115=> "1", 
    116 to 118=> "0", 119 => "1", 120 => "0", 121 to 122=> "1", 123 => "0", 124 => "1", 125 to 128=> "0", 
    129 to 131=> "1", 132 to 134=> "0", 135 to 139=> "1", 140 to 146=> "0", 147 => "1", 148 => "0", 149 => "1", 
    150 to 151=> "0", 152 => "1", 153 to 154=> "0", 155 => "1", 156 => "0", 157 to 160=> "1", 161 => "0", 
    162 to 167=> "1", 168 => "0", 169 to 170=> "1", 171 to 172=> "0", 173 => "1", 174 => "0", 175 => "1", 
    176 => "0", 177 to 180=> "1", 181 to 194=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_PgM is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_PgM is
    component predict_ensemble_PgM_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_PgM_rom_U :  component predict_ensemble_PgM_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;



-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_9j0_rom is 
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


architecture rtl of predict_ensemble_9j0_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 to 7=> "0", 8 => "1", 9 => "0", 
    10 => "1", 11 to 12=> "0", 13 => "1", 14 to 15=> "0", 16 => "1", 17 to 18=> "0", 19 to 22=> "1", 
    23 => "0", 24 => "1", 25 => "0", 26 to 28=> "1", 29 to 30=> "0", 31 => "1", 32 to 34=> "0", 
    35 to 38=> "1", 39 => "0", 40 => "1", 41 to 43=> "0", 44 to 45=> "1", 46 => "0", 47 => "1", 
    48 => "0", 49 => "1", 50 => "0", 51 => "1", 52 to 54=> "0", 55 to 56=> "1", 57 to 58=> "0", 
    59 to 60=> "1", 61 => "0", 62 to 63=> "1", 64 to 65=> "0", 66 => "1", 67 to 70=> "0", 71 => "1", 
    72 => "0", 73 to 74=> "1", 75 to 76=> "0", 77 => "1", 78 to 79=> "0", 80 => "1", 81 => "0", 
    82 to 83=> "1", 84 to 85=> "0", 86 => "1", 87 => "0", 88 => "1", 89 to 90=> "0", 91 => "1", 
    92 => "0", 93 => "1", 94 to 95=> "0", 96 to 98=> "1", 99 to 100=> "0", 101 => "1", 102 to 104=> "0", 
    105 to 106=> "1", 107 => "0", 108 => "1", 109 => "0", 110 to 111=> "1", 112 => "0", 113 to 114=> "1", 
    115 to 117=> "0", 118 to 120=> "1", 121 to 122=> "0", 123 to 124=> "1", 125 => "0", 126 => "1", 127 => "0", 
    128 => "1", 129 to 130=> "0", 131 => "1", 132 to 134=> "0", 135 to 140=> "1", 141 to 142=> "0", 143 => "1", 
    144 to 148=> "0", 149 to 151=> "1", 152 => "0", 153 to 156=> "1", 157 to 159=> "0", 160 to 162=> "1", 163 to 164=> "0", 
    165 => "1", 166 => "0", 167 => "1", 168 => "0", 169 to 170=> "1", 171 => "0", 172 => "1", 
    173 to 174=> "0", 175 => "1", 176 => "0", 177 to 181=> "1", 182 => "0", 183 to 185=> "1", 186 => "0", 
    187 to 188=> "1", 189 to 194=> "0" );

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

entity predict_ensemble_9j0 is
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

architecture arch of predict_ensemble_9j0 is
    component predict_ensemble_9j0_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_9j0_rom_U :  component predict_ensemble_9j0_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;



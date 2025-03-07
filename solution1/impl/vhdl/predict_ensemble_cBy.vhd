-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cBy_rom is 
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


architecture rtl of predict_ensemble_cBy_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "0", 3 => "1", 4 => "0", 5 => "1", 6 => "0", 7 => "1", 8 => "0", 
    9 => "1", 10 to 12=> "0", 13 => "1", 14 to 15=> "0", 16 to 19=> "1", 20 to 22=> "0", 23 to 24=> "1", 
    25 => "0", 26 to 27=> "1", 28 => "0", 29 to 31=> "1", 32 to 33=> "0", 34 => "1", 35 => "0", 
    36 => "1", 37 to 38=> "0", 39 => "1", 40 => "0", 41 to 43=> "1", 44 to 47=> "0", 48 to 49=> "1", 
    50 to 51=> "0", 52 to 53=> "1", 54 => "0", 55 to 56=> "1", 57 to 60=> "0", 61 to 65=> "1", 66 to 67=> "0", 
    68 => "1", 69 => "0", 70 => "1", 71 => "0", 72 => "1", 73 => "0", 74 to 75=> "1", 
    76 => "0", 77 => "1", 78 => "0", 79 => "1", 80 to 83=> "0", 84 => "1", 85 to 87=> "0", 
    88 => "1", 89 to 90=> "0", 91 => "1", 92 => "0", 93 => "1", 94 to 95=> "0", 96 to 99=> "1", 
    100 => "0", 101 => "1", 102 => "0", 103 to 104=> "1", 105 => "0", 106 to 107=> "1", 108 to 109=> "0", 
    110 to 113=> "1", 114 => "0", 115 => "1", 116 to 120=> "0", 121 to 125=> "1", 126 to 127=> "0", 128 => "1", 
    129 to 132=> "0", 133 to 137=> "1", 138 to 144=> "0", 145 to 150=> "1", 151 to 154=> "0", 155 => "1", 156 => "0", 
    157 => "1", 158 => "0", 159 to 161=> "1", 162 => "0", 163 to 165=> "1", 166 to 170=> "0", 171 to 174=> "1", 
    175 => "0", 176 to 177=> "1", 178 to 179=> "0", 180 to 182=> "1", 183 to 194=> "0" );

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

entity predict_ensemble_cBy is
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

architecture arch of predict_ensemble_cBy is
    component predict_ensemble_cBy_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cBy_rom_U :  component predict_ensemble_cBy_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;



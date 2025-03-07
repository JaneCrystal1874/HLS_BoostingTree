-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dJJ_rom is 
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


architecture rtl of predict_ensemble_dJJ_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0", 4 to 5=> "1", 6 to 7=> "0", 8 => "1", 9 to 10=> "0", 11 to 12=> "1", 13 to 16=> "0", 
    17 => "1", 18 => "0", 19 => "1", 20 => "0", 21 to 22=> "1", 23 to 26=> "0", 27 to 29=> "1", 
    30 to 36=> "0", 37 => "1", 38 => "0", 39 to 41=> "1", 42 to 43=> "0", 44 to 45=> "1", 46 to 48=> "0", 
    49 => "1", 50 => "0", 51 to 52=> "1", 53 to 55=> "0", 56 => "1", 57 => "0", 58 => "1", 
    59 to 60=> "0", 61 => "1", 62 to 63=> "0", 64 to 67=> "1", 68 => "0", 69 => "1", 70 to 74=> "0", 
    75 => "1", 76 => "0", 77 to 78=> "1", 79 to 80=> "0", 81 => "1", 82 to 84=> "0", 85 => "1", 
    86 => "0", 87 to 89=> "1", 90 to 92=> "0", 93 to 94=> "1", 95 => "0", 96 to 99=> "1", 100 => "0", 
    101 to 103=> "1", 104 => "0", 105 to 106=> "1", 107 => "0", 108 => "1", 109 => "0", 110 to 115=> "1", 
    116 => "0", 117 to 118=> "1", 119 to 120=> "0", 121 to 123=> "1", 124 to 125=> "0", 126 => "1", 127 => "0", 
    128 to 129=> "1", 130 to 132=> "0", 133 => "1", 134 => "0", 135 to 136=> "1", 137 => "0", 138 => "1", 
    139 => "0", 140 => "1", 141 to 142=> "0", 143 to 146=> "1", 147 to 152=> "0", 153 to 154=> "1", 155 to 157=> "0", 
    158 => "1", 159 to 160=> "0", 161 => "1", 162 to 164=> "0", 165 to 168=> "1", 169 => "0", 170 to 171=> "1", 
    172 => "0", 173 to 182=> "1", 183 to 194=> "0" );

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

entity predict_ensemble_dJJ is
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

architecture arch of predict_ensemble_dJJ is
    component predict_ensemble_dJJ_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dJJ_rom_U :  component predict_ensemble_dJJ_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;



-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_fgY_rom is 
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


architecture rtl of predict_ensemble_fgY_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0", 4 => "1", 5 => "0", 6 to 7=> "1", 8 to 10=> "0", 11 to 13=> "1", 14 to 16=> "0", 
    17 => "1", 18 => "0", 19 to 20=> "1", 21 to 22=> "0", 23 => "1", 24 => "0", 25 => "1", 
    26 => "0", 27 => "1", 28 => "0", 29 to 31=> "1", 32 => "0", 33 => "1", 34 => "0", 
    35 to 36=> "1", 37 to 38=> "0", 39 to 40=> "1", 41 to 42=> "0", 43 to 45=> "1", 46 to 47=> "0", 48 => "1", 
    49 to 51=> "0", 52 => "1", 53 to 55=> "0", 56 => "1", 57 to 58=> "0", 59 => "1", 60 to 61=> "0", 
    62 to 67=> "1", 68 to 69=> "0", 70 => "1", 71 to 72=> "0", 73 => "1", 74 => "0", 75 to 77=> "1", 
    78 to 83=> "0", 84 => "1", 85 to 88=> "0", 89 to 90=> "1", 91 => "0", 92 to 96=> "1", 97 to 100=> "0", 
    101 => "1", 102 to 104=> "0", 105 to 106=> "1", 107 => "0", 108 to 109=> "1", 110 to 112=> "0", 113 => "1", 
    114 => "0", 115 to 116=> "1", 117 to 120=> "0", 121 => "1", 122 to 123=> "0", 124 => "1", 125 => "0", 
    126 => "1", 127 => "0", 128 => "1", 129 => "0", 130 => "1", 131 to 132=> "0", 133 => "1", 
    134 => "0", 135 to 141=> "1", 142 => "0", 143 to 144=> "1", 145 to 146=> "0", 147 to 148=> "1", 149 => "0", 
    150 to 155=> "1", 156 to 158=> "0", 159 => "1", 160 to 164=> "0", 165 to 167=> "1", 168 => "0", 169 => "1", 
    170 => "0", 171 to 173=> "1", 174 => "0", 175 => "1", 176 to 177=> "0", 178 => "1", 179 to 180=> "0", 
    181 => "1", 182 => "0", 183 to 185=> "1", 186 => "0", 187 to 192=> "1", 193 to 194=> "0" );

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

entity predict_ensemble_fgY is
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

architecture arch of predict_ensemble_fgY is
    component predict_ensemble_fgY_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_fgY_rom_U :  component predict_ensemble_fgY_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


